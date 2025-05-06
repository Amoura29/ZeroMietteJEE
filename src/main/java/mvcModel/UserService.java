package mvcModel;

import java.util.ArrayList;
import java.util.List;

import entities.User;
import jakarta.ejb.LocalBean;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

/**
 * Session Bean implementation class UserService
 */
@Stateless
@LocalBean
public class UserService {
	@PersistenceContext(unitName="ZeroMiette")
	 private EntityManager em;
    /**
     * Default constructor. 
     */
    public UserService() {
        // TODO Auto-generated constructor stub
    }
    public User getUserbyId(int id) {
    	User user=em.find(User.class, id);
    	return user;
    }
    public User getUserbyEmail(String email) {
    	User user=new User();
    	TypedQuery<User> query=em.createNamedQuery("User.findUserbyEmail", User.class);
    	query.setParameter(1, email);
    	user=query.getSingleResult();
    	return user;
    }
    public List<User> getAllUserbyState(String state){
    	List<User> users=new ArrayList<User>();
    	TypedQuery<User> query =em.createNamedQuery("User.findAllbyState",User.class);
    	query.setParameter(1, state);
    	users=query.getResultList();
    	return users;
    }
    public String deleteUserById(int id){
    	User user = em.find(User.class, id);
    	if(user!=null)
    		em.remove(user);
    	else return "introuvable";
    	user = em.find(User.class, id);
    	if(user!=null)
    		return "failure";
    	return "success";
    }
    public String changeUserState(int id) {
    	try {
			User user=em.find(User.class,id);
			user.setState("accepted");
			em.merge(user);
			return "success";
		} catch (Exception e) {
			return "failed";
		}
    	
    }
    public String addUserP(String email,String pwd,String userN) {
    	try {
			User user;
			TypedQuery<User> query =em.createNamedQuery("User.findUserbyEmail",User.class);
			query.setParameter(1, email);
			if (query.getResultList().isEmpty()) {
				return "there is no user with the email"+email+"you can try signing up!!";
			}else {
				user=query.getSingleResult();
				if (user.getPwd()!=null) {
					return "you are not signing in for the first time!!";
				}else {
					user.setPwd(pwd);
					user.setUserName(userN);
					
			    	em.merge(user);
			    	return "success";
				}
			}
		} catch (Exception e) {
			return "failed";
		}
    }
    
    public void addUser(String add,String des,String ema,String fn,String ln,String num,String reg,String proof,String r) {
    	User u=new User();
    	u.setAddress(add);
    	u.setDescription(des);
    	u.setEmail(ema);
    	u.setFirstName(fn);
    	u.setLastName(ln);
    	u.setNumber(num);
    	u.setRegion(reg);
    	u.setRole(r);
    	u.setProof(proof);
    	u.setState("pending");
    	em.persist(u);
    }
}
