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
@NamedQuery(name="Announcement.findAll", query="SELECT a FROM Announcement a")
public class Announcement implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String annCode;

	@Lob
	private String content;

	private Timestamp dateC;

	private Time deadline;

	@Lob
	private byte[] img;

	private String state;

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

	public byte[] getImg() {
		return this.img;
	}

	public void setImg(byte[] img) {
		this.img = img;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
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