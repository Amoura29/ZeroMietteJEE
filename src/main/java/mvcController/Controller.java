package mvcController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import mvcModel.AnnouncementService;
import mvcModel.UserService;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.mindrot.jbcrypt.BCrypt;

import entities.Announcement;
import entities.User;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	@EJB
	private UserService UserService;
	
	@EJB
	private AnnouncementService annService;
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sub=request.getParameter("myBtn");
		if ((sub!=null)&&(sub.equals("redir"))) {
			if (request.getParameter("state") != null) {
				String state=request.getParameter("state");
				if (state.equals("pending")||(state.equals("accepted"))) {
					List<User> users;
					users=this.UserService.getAllUserbyState(state);
					if ((users!=null)&& (!users.isEmpty())) {
						request.setAttribute("listUsers", users);
						request.getRequestDispatcher("getList.jsp").forward(request, response);
					}else {
						request.setAttribute("error", "there are no"+state+" users yet!!");
						request.getRequestDispatcher("getList.jsp").forward(request, response);
					}
				}else if(state.equals("available")){
					List<Announcement> announcements;
					/*announcements=this.annService.getAllAnnouncements();
					if (announcements!=null) {
						request.setAttribute("listAnn", announcements);
						request.getRequestDispatcher("getList.jsp").forward(request, response);
					}else {
						request.setAttribute("error", "there are no"+state+" announcements yet!!");
						request.getRequestDispatcher("getList.jsp").forward(request, response);
					}*/
				}
			}else if (request.getParameter("page")!=null) {
				String page=request.getParameter("page");
				request.getRequestDispatcher(page).forward(request, response);
			}
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String sub=request.getParameter("myBtn");
		if ((sub!=null)&&(sub.equals("signUp"))) {
			final String upPath = "C:/xampp/htdocs/backend/Proofs";
			
			String ln=request.getParameter("ln");
			String fn=request.getParameter("fn");
			String mai=request.getParameter("mai");
			String region=request.getParameter("region");
			String add=request.getParameter("add");
			String num=request.getParameter("num");
			String role=request.getParameter("rad");
			String description=request.getParameter("desc");
			Part file= request.getPart("proof");
			
			String ogfileName=Paths.get(file.getSubmittedFileName()).getFileName().toString();
			int dotIndex = ogfileName.lastIndexOf('.');
			String fileExtention = "";
	        if (dotIndex > 0 && dotIndex < ogfileName.length() - 1) {
	            fileExtention=ogfileName.substring(dotIndex);
	        }
	        String randName=UUID.randomUUID().toString().replaceAll("-", "").substring(0, 8);
			String fileName="Proof"+randName+fileExtention;
			
			String filePath=upPath+File.separator+fileName;
			file.write(filePath);
			
			this.UserService.addUser(add, description, mai, fn, ln, num, region, filePath, role);
			
			response.getWriter().append("user was created!!");
		}else if ((sub!=null)&&(sub.equals("first sign in"))) {
			String email=request.getParameter("email");
			String userName=request.getParameter("un");
			String password=request.getParameter("password");
			String password1=request.getParameter("password1");
			
			if (password.equals(password1)) {
				String pwd=BCrypt.hashpw(password, BCrypt.gensalt());
				String mess=this.UserService.addUserP(email, pwd, userName);
				if (mess.equals("success")) {
					HttpSession session = request.getSession(true);
			        session.setMaxInactiveInterval(60*60*60);
			        User u=this.UserService.getUserbyEmail(email);
			        session.setAttribute("activeUser", u);
			        if (u.getRole().equals("administrator")) {
			        	request.getRequestDispatcher("getAllUsers.jsp").forward(request, response);
			        }else if (u.getRole().equals("donor")) {
			        	request.getRequestDispatcher("donor.jsp").forward(request, response);
			        }else {
			        	request.getRequestDispatcher("reciever.jsp").forward(request, response);
			        }
				}else if(mess.equals("you are not signing in for the first time!!")) {
					request.setAttribute("error", mess+"\n you can sign in here");
					request.getRequestDispatcher("authenticate.jsp").forward(request, response);
				}else {
					request.setAttribute("error", mess);
			        request.getRequestDispatcher("FirstSignIn.jsp").forward(request, response);
				}
			}else {
				request.setAttribute("error", "second password must be the same as the first password!!");
		        request.getRequestDispatcher("FirstSignIn.jsp").forward(request, response);
			}
			
		}else if ((sub!=null)&&(sub.equals("sign in"))) {
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			User u=this.UserService.getUserbyEmail(email);
			
			String Hashpwd=u.getPwd();
			Hashpwd = Hashpwd.replaceFirst("\\$2y\\$", "\\$2a\\$");
			
	        if ((BCrypt.checkpw(password, Hashpwd))&&(u!=null)) {
	        	HttpSession session = request.getSession(true);
		        session.setMaxInactiveInterval(60*60*60);
		        session.setAttribute("activeUser", u);
		        
		        if (u.getRole().equals("administrator")) {
		        	request.getRequestDispatcher("Administrator.jsp").forward(request, response);
		        }else if (u.getRole().equals("donor")) {
		        	request.getRequestDispatcher("donor.jsp").forward(request, response);
		        }else {
		        	request.getRequestDispatcher("reciever.jsp").forward(request, response);
		        }
	        }else {
	        	request.setAttribute("error", "email and/or password is incorrect!!");
	        	request.getRequestDispatcher("authenticate.jsp").forward(request, response);
	        }
		}
	}

}
