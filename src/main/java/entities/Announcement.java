package entities;

import java.io.Serializable;
import jakarta.persistence.*;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the announcement database table.
 * 
 */
@Entity
@NamedQueries({
	@NamedQuery(name="Announcement.findByState", query="SELECT a FROM Announcement a WHERE state = ?1")
	@NamedQuery(name="Announcement.findAll", query="SELECT a FROM Announcement a"),
/**	@NamedQuery(name="Announcement.getAnnouncementByDonorIdAndState", query="SELECT a FROM Announcement a where userId=?1 and state=?2 ")*/
})

public class Announcement implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String annCode;

	@Lob
	
	private String title;
	
	private String content;

	private Timestamp dateC;

	private Time deadline;

	private String img;

	private String state;
	
	private int quantity;
	
	private String recipientType;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="donId")
	private User user;

	//bi-directional many-to-one association to Request
	@OneToMany(mappedBy="announcement", fetch=FetchType.EAGER)
	private List<Request> requests;

	public Announcement() {
	}

	public String getAnnCode() {
		return this.annCode;
	}

	public void setAnnCode(String annCode) {
		this.annCode = annCode;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getDateC() {
		return this.dateC;
	}

	public void setDateC(Timestamp dateC) {
		this.dateC = dateC;
	}

	public Time getDeadline() {
		return this.deadline;
	}

	public void setDeadline(Time deadline) {
		this.deadline = deadline;
	}

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Request> getRequests() {
		return this.requests;
	}

	public void setRequests(List<Request> requests) {
		this.requests = requests;
	}

	public Request addRequest(Request request) {
		getRequests().add(request);
		request.setAnnouncement(this);

		return request;
	}

	public Request removeRequest(Request request) {
		getRequests().remove(request);
		request.setAnnouncement(null);

		return request;
	}

}