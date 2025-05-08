package mvcModel;

import java.util.ArrayList;
import java.util.List;

import entities.Request;
import jakarta.ejb.LocalBean;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

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
    public List<Request> getUserRequestsByState(int userId ,String state){
    	 List<Request> requests =new ArrayList<Request>();
    	 TypedQuery<Request> query =
    	 em.createNamedQuery("Request.findByIdAndState",Request.class);
    	 query.setParameter(1, userId);
    	 query.setParameter(2, state);
    	 requests = query.getResultList();
    	 return requests;
    }
    public void addRequest(Request r){
			Request req = em.find(Request.class, r.getId());
			if(req==null) {
				em.persist(r);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   	}
    
    public List<Request> getPendingAnnRequests(String annCode){
    	return em.createNamedQuery("Request.getPendingByAnnCode", Request.class).setParameter(1,annCode).getResultList();
    	
    }
    
    public List<Request> getAcceptedAnnRequests(String annCode){
    	return em.createNamedQuery("Request.getAcceptedWithUserByAnnCode", Request.class).setParameter(1,annCode).getResultList();
    	
    }
    
    public boolean approveRequest(RequestPK id) {
    	try {
			Request request=em.find(Request.class, id);
			if (request!=null) {
				request.setState("accepted");
				em.merge(request);
				return true;
			}return false;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
    	
    	
    }
    
    public boolean declineRequest(RequestPK id) {
    	try {
			Request request=em.find(Request.class, id);
			if (request!=null) {
				request.setState("refused");
				em.merge(request);
				return true;
			}return false;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
    	
    } 
				em.persist(r);}
		
   	}
    public boolean checkRequest(int userId ,String annCode){
     Request req= new Request();
   	 TypedQuery<Request> query =
   	 em.createNamedQuery("Request.findRequest",Request.class);
   	 query.setParameter(1, userId);
   	 query.setParameter(2, annCode);
   	 req = query.getSingleResult();
   	 if(req==null) {
   		 return false;
   	 }else {
   		 return true;
   	 }
   	 
   }
    
    
}
