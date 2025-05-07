package mvcModel;

import java.sql.Time;
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
    
    public List<Announcement> getAnnouncementByDonorIdAndState(int userId, String state){
    	return em.createNamedQuery("Announcement.getAnnouncementByUserIdAndState", Announcement.class).setParameter(1, userId).setParameter(2, state).getResultList();
    }
    
    public boolean createAnnouncement(String title,int quantity, String category,String img,Time deadline,String content) {
    	try {
			Announcement announcement = new Announcement();
			announcement.setCategory(category);
			announcement.setContent(content);
			announcement.setDeadline(deadline);
			announcement.setImg(img);
			announcement.setQuantity(quantity);
			announcement.setTitle(title);
			em.persist(announcement);
			return true;
		} catch (Exception e) {
			return false;
		}
    }
    
    public boolean deleteAnnouncement(String annCode) {
    	try {
			em.remove(em.find(Announcement.class, annCode));
			return true;
		} catch (Exception e) {
			return false;
		}
    }
  
    
    public boolean updateAnnouncement(String annCode,String title,int quantity, String category,String img,Time deadline,String content) {
    	try {
    		Announcement announcement=em.find(Announcement.class, annCode);
			if (announcement!=null) {
				announcement.setCategory(category);
				announcement.setContent(content);
				announcement.setDeadline(deadline);
				announcement.setImg(img);
				announcement.setQuantity(quantity);
				announcement.setTitle(title);
				em.merge(announcement);
				return true;
			}return false;
		} catch (Exception e) {
			return false;
		}
    }
    
   

}
