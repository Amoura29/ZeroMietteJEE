package mvcModel;

import java.util.ArrayList;
import java.util.List;

import entities.Announcement;
import jakarta.ejb.LocalBean;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

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
    public List<Announcement> getAnnByState(String state){
   	 List<Announcement> announcements =new ArrayList<Announcement>();
   	 TypedQuery<Announcement> query =
   	 em.createNamedQuery("Announcement.findByState",Announcement.class);
   	 query.setParameter(1, state);
   	 announcements = query.getResultList();
   	 return announcements;
   }

}
