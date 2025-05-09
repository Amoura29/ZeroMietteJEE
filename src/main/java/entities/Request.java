package entities;

import java.io.Serializable;
import jakarta.persistence.*;
import java.sql.Timestamp;


/**
 * The persistent class for the request database table.
 * 
 */
@Entity
@NamedQueries({
@NamedQuery(name="Request.findByIdAndState", query="SELECT r FROM Request r WHERE r.id.userId = ?1 AND state = ?2"),
@NamedQuery(
	    name = "Request.getAcceptedWithUserByAnnCode",
	    query = "SELECT r FROM Request r JOIN FETCH r.user u WHERE r.annCode = ?1 AND r.state = 'ACCEPTED' ORDER BY r.dateC DESC"),
@NamedQuery(
	    name = "Request.getPendingByAnnCode",
	    query = "SELECT r FROM Request r WHERE r.annCode = ?1 AND r.state = 'PENDING' ORDER BY r.dateC DESC")

})
public class Request implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private RequestPK id;

	private Timestamp dateC;

	@Lob
	private String description;

	private int quantity;

	private String state;

	//bi-directional many-to-one association to Announcement
	@ManyToOne
	@JoinColumn(name="annCode")
	private Announcement announcement;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="userId")
	private User user;

	public Request() {
	}

	public RequestPK getId() {
		return this.id;
	}

	public void setId(RequestPK id) {
		this.id = id;
	}

	public Timestamp getDateC() {
		return this.dateC;
	}

	public void setDateC(Timestamp dateC) {
		this.dateC = dateC;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Announcement getAnnouncement() {
		return this.announcement;
	}

	public void setAnnouncement(Announcement announcement) {
		this.announcement = announcement;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}