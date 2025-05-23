package mvcController;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import mvcModel.AnnouncementService;
import mvcModel.RequestService;
import mvcModel.UserService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.mindrot.jbcrypt.BCrypt;

import entities.Announcement;
import entities.Request;
import entities.RequestPK;
import entities.User;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB
	private AnnouncementService annService;
	@EJB
    private RequestService RequestService; 
	@EJB
	private UserService userService;
	
       
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
		System.out.println("hi");
		
		String sub=request.getParameter("myBtn");
		System.out.println(sub);
		if ((sub!=null)&&(sub.equals("sign in"))) {
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			User u=userService.getUserbyEmail(email);
			
			String Hashpwd=u.getPwd();
			Hashpwd = Hashpwd.replaceFirst("\\$2y\\$", "\\$2a\\$");
			
	        if ((u!=null)&&(password.equals(u.getPwd())||BCrypt.checkpw(password, Hashpwd))){                             
	        	HttpSession session = request.getSession(true);
		        session.setMaxInactiveInterval(60*60*60);
		        session.setAttribute("activeUser", u);
		        
		        if (u.getRole().equals("administrator")) {
		        	request.getRequestDispatcher("administrator.jsp").forward(request, response);
		        }else if (u.getRole().equals("donor")) {
						
		        	request.getRequestDispatcher("donor.jsp").forward(request, response);
		        }else {
		        	List<Announcement> ann=annService.getAnnByState("available");
                    
		        	if (ann!= null && ann.size()>0){
		        		request.setAttribute("ann", ann);
		        		request.getRequestDispatcher("reciever.jsp").forward(request, response);
		        	}else {
		        		request.setAttribute("error", "There are no results that meet the research!!");
		        		request.getRequestDispatcher("reciever.jsp").forward(request, response);
		        	}
		        }
	        }else {
	        	request.setAttribute("error", "email and/or password is incorrect!!");
	        	request.getRequestDispatcher("authenticate.jsp").forward(request, response);
	        }
		}else if ((sub!=null)&&(sub.equals("sign up"))) {
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
			String fileName="proof"+randName+fileExtention;
			
			String filePath=upPath+File.separator+fileName;
			file.write(filePath);
			
			String fileURL="http://localhost/backend/proofs"+File.separator+fileName;
			
			userService.addUser(add, description, mai, fn, ln, num, region, fileURL, role);
			
		}else if((sub!=null)&&(sub.equals("deleteUser"))) {
			int userId=Integer.parseInt(request.getParameter("userId"));
			String state=request.getParameter("state");
			String mess=userService.deleteUserById(userId);
			request.setAttribute("message", mess);
			List<User> users;
			users=userService.getAllUserbyState(state);
			if ((users!=null)&&(!users.isEmpty())) {
				request.setAttribute("listUsers", users);
				request.getRequestDispatcher("getList.jsp").forward(request, response);
			}else {
				request.setAttribute("error", "there are no "+state+" users yet!!");
				request.getRequestDispatcher("getList.jsp").forward(request, response);
			}
		}else if ((sub!=null)&&(sub.equals("changeState"))) {
			int userId=Integer.parseInt(request.getParameter("userId"));
			String mess=userService.changeUserState(userId);
			request.setAttribute("message", mess);
			List<User> users;
			users=userService.getAllUserbyState("pending");
			if ((users!=null)&&(!users.isEmpty())) {
				request.setAttribute("listUsers", users);
				request.getRequestDispatcher("getList.jsp").forward(request, response);
			}else {
				request.setAttribute("error", "there are no pending users yet!!");
				request.getRequestDispatcher("getList.jsp").forward(request, response);
			}
			
		}else if ((sub!=null)&&(sub.equals("signOut"))) {
			HttpSession session=request.getSession(false);
			if (session != null) {
				if (session.getAttribute("activeUser")!=null) {
					session.removeAttribute("activeUser");
					response.sendRedirect("index.html");
				}
			}
		
		}else if ((sub!=null)&&(sub.equals("redir"))) {
			if (request.getParameter("state") != null) {
				String state=request.getParameter("state");
				if (state.equals("pending")||(state.equals("accepted"))) {
					List<User> users;
					users=userService.getAllUserbyState(state);
					if ((users!=null)&&(!users.isEmpty())) {
						request.setAttribute("listUsers", users);
						request.getRequestDispatcher("getList.jsp").forward(request, response);
				    }else {
						request.setAttribute("error", "there are no"+state+" users yet!!");
						request.getRequestDispatcher("getList.jsp").forward(request, response);
					}
				
				}else if(state.equals("available")){
					List<Announcement> announcements;
					announcements=this.annService.getAnnByState(state);
					if (announcements!=null) {
						request.setAttribute("listAnn", announcements);
						request.getRequestDispatcher("getList.jsp").forward(request, response);
					}else {
						request.setAttribute("error", "there are no"+state+" announcements yet!!");
						request.getRequestDispatcher("getList.jsp").forward(request, response);
					}
				}
			}else if (request.getParameter("page")!=null) {
				String page=request.getParameter("page");
				if (page.equals("getUser.jsp")) {
					int id=Integer.parseInt(request.getParameter("userId"));
					User user=userService.getUserbyId(id);
					request.setAttribute("user", user);
					if (user.getProof()!=null) {
						String file=user.getProof();
						String ogfile=Paths.get(file).getFileName().toString();
						int dotIndex = ogfile.lastIndexOf('.');
						String fileExtention = "";
						if (dotIndex > 0 && dotIndex < ogfile.length() - 1) {
							fileExtention=ogfile.substring(dotIndex);
						}
						if (fileExtention!="") {
							request.setAttribute("extention", fileExtention);
						}
					}
					request.getRequestDispatcher(page).forward(request, response);
				}else request.getRequestDispatcher(page).forward(request, response);
			}
		}else if (sub != null && sub.equals("Announcements")) {
			HttpSession session = request.getSession(false);
		    User u = (session != null) ? (User) session.getAttribute("activeUser") : null;
			if (u == null) {
		        request.setAttribute("error", "Session expired. Please sign in again.");
		        request.getRequestDispatcher("authenticate.jsp").forward(request, response);
		        return;
		    }
		    List<Announcement> ann = annService.getAnnByState("available");

		    if (ann != null && !ann.isEmpty()) {
		        request.setAttribute("ann", ann);
		    } else {
		        request.setAttribute("error", "There are no results that meet the research!!");
		    }

		    request.getRequestDispatcher("reciever.jsp").forward(request, response);
		}else if (sub != null && sub.equals("requests")) {
			HttpSession session = request.getSession(false);
		    User u = (session != null) ? (User) session.getAttribute("activeUser") : null;
		    if (u == null) {
		        request.setAttribute("error", "Session expired. Please sign in again.");
		        request.getRequestDispatcher("authenticate.jsp").forward(request, response);
		        return;
		    }
		    List<Request> reqs = RequestService.getUserRequestsByState(u.getUserId(),"pending");
		    if (reqs != null && !reqs.isEmpty()) {
		    	request.setAttribute("reqs", reqs);
		    } else {
		        request.setAttribute("error", "There are no results that meet the research!!");
		    }

		    request.getRequestDispatcher("reciever.jsp").forward(request, response);
		}else if(sub != null && sub.equals("addrequest")) {
			HttpSession session = request.getSession(false);
		    User u = (session != null) ? (User) session.getAttribute("activeUser") : null;
			if (u == null) {
		        request.setAttribute("error", "Session expired. Please sign in again.");
		        request.getRequestDispatcher("authenticate.jsp").forward(request, response);
		        return;
		    }
			String annCode = request.getParameter("annCode");
			boolean check= RequestService.checkRequest(u.getUserId(), annCode);
			if(check==false) {
				String desc=request.getParameter("desc");
				String qte=request.getParameter("qte");
				int q=Integer.parseInt(qte);
				RequestPK RK =new RequestPK();
				RK.setUserId(u.getUserId());
				RK.setAnnCode(annCode);
			    Request R= new Request();
			    R.setId(RK);
			    R.setDescription(desc);
			    R.setQuantity(q);
			    R.setAnnouncement(annService.getAnnByCode(annCode));
				RequestService.addRequest(R);
				request.setAttribute("result","success");
			}else {
				request.setAttribute("you already sended a request to this announcement", annCode);
				
			}
			
		}else {
			response.sendRedirect("index.html");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("hihi");
		doGet(request, response);
	}

}
