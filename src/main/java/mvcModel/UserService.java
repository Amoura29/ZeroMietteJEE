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
    public void addUser(String add,String des,String ema,String fn,String ln,String num,String pro,String pwd,String reg,String r,String state) {
    	User u=new User();
    	u.setAddress(add);
    	u.setDescription(des);
    	u.setEmail(ema);
    	u.setFirstName(fn);
    	u.setLastName(ln);
    	u.setNumber(num);
    	u.setProof(pro);
    	u.setPwd(pwd);
    	u.setRegion(reg);
    	u.setRole(r);
    	u.setState(state);
    	em.persist(u);
    }
}
