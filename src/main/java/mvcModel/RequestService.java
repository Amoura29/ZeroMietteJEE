package mvcModel;

import jakarta.ejb.LocalBean;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

/**
 * Session Bean implementation class RequestService
 */
@Stateless
@LocalBean
public class RequestService {
	@PersistenceContext(unitName="ZeroMiette")
	 private EntityManager em;
    /**
     * Default constructor. 
     */
    public RequestService() {
        // TODO Auto-generated constructor stub
    }

}
