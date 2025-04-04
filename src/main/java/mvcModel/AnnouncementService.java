package mvcModel;

import jakarta.ejb.LocalBean;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

/**
 * Session Bean implementation class AnnouncementService
 */
@Stateless
@LocalBean
public class AnnouncementService {
	@PersistenceContext(unitName="ZeroMiette")
	 private EntityManager em;
    /**
     * Default constructor. 
     */
    public AnnouncementService() {
        // TODO Auto-generated constructor stub
    }

}
