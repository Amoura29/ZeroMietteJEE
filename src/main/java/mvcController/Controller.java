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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

//import org.mindrot.jbcrypt.BCrypt;

import entities.User;
import entities.Announcement;
import entities.Request;
import entities.RequestPK;
/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	@EJB
	private UserService userService;
	
	@EJB
	private AnnouncementService annService;

	@EJB
    private RequestService RequestService; 

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
		/*String navbtn =request.getParameter("navbtn");
			if(navbtn!=null && navbtn.equals("requests")) {
				String reqstate = request.getParameter("reqstate");
			if(reqstate!=null && reqstate.equals("refused")) {
				List<Request> s=requestService.getAllSujectsByTitleAndAffiliation(intitule,affiliation);
			
			}else if(reqstate!=null && reqstate.equals("accepted")) {
							
			}
		} */

		String sub=request.getParameter("myBtn");
		if ((sub!=null)&&(sub.equals("redir"))) {
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
				}/*else if(state.equals("available")){
				}/*else if(state.equals("available")){
					List<Announcement> announcements;
					announcements=this.annService.getAllAnnouncements();
					announcements=this.annService.getAllAnnouncements();
					if (announcements!=null) {
						request.setAttribute("listAnn", announcements);
						request.getRequestDispatcher("getList.jsp").forward(request, response);
					}else {
						request.setAttribute("error", "there are no"+state+" announcements yet!!");
						request.getRequestDispatcher("getList.jsp").forward(request, response);
					}
				}*/
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
		}else if ((sub!=null)&&(sub.equals("signOut"))) {
			HttpSession session=request.getSession(false);
			if (session != null) {
				if (session.getAttribute("activeUser")!=null) {
					session.removeAttribute("activeUser");
					response.sendRedirect("index.jsp");
				}
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
		}else if ((sub!=null)&&(sub.equals("signUp"))) {
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
			
			userService.addUser(add, description, mai, fn, ln, num, region, filePath, role);
			
			response.getWriter().append("user was created!!");
		}else if ((sub!=null)&&(sub.equals("first sign in"))) {
			String email=request.getParameter("email");
			String userName=request.getParameter("un");
			String password=request.getParameter("password");
			String password1=request.getParameter("password1");
			
			if (password.equals(password1)) {
				String pwd=password;//BCrypt.hashpw(password, BCrypt.gensalt());
				String mess=userService.addUserP(email, pwd, userName);
				if (mess.equals("success")) {
					HttpSession session = request.getSession(true);
			        session.setMaxInactiveInterval(60*60*60);
			        User u=userService.getUserbyEmail(email);
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
			
			User u=userService.getUserbyEmail(email);
			
			String Hashpwd=u.getPwd();
			Hashpwd = Hashpwd.replaceFirst("\\$2y\\$", "\\$2a\\$");
			
	        if ((password.equals(u.getPwd()))&&(u!=null)){                                       //(BCrypt.checkpw(password, Hashpwd))&&(u!=null)) {
	        	HttpSession session = request.getSession(true);
		        session.setMaxInactiveInterval(60*60*60);
		        session.setAttribute("activeUser", u);
		        
		        if (u.getRole().equals("administrator")) {
		        	request.getRequestDispatcher("Administrator.jsp").forward(request, response);
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
			/*User u=userService.getUserbyId(2);
			response.getWriter().append(u.getFirstName());*/
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
