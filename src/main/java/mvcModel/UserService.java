package mvcModel;

import jakarta.ejb.LocalBean;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

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

}
