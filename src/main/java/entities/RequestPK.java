package entities;

import java.io.Serializable;
import jakarta.persistence.*;

/**
 * The primary key class for the request database table.
 * 
 */
@Embeddable
public class RequestPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(insertable=false, updatable=false)
	private String annCode;

	@Column(insertable=false, updatable=false)
	private int userId;

	public RequestPK() {
	}
	public String getAnnCode() {
		return this.annCode;
	}
	public void setAnnCode(String annCode) {
		this.annCode = annCode;
	}
	public int getUserId() {
		return this.userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof RequestPK)) {
			return false;
		}
		RequestPK castOther = (RequestPK)other;
		return 
			this.annCode.equals(castOther.annCode)
			&& (this.userId == castOther.userId);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.annCode.hashCode();
		hash = hash * prime + this.userId;
		
		return hash;
	}
}