package org.ngbw.web.actions;

import java.util.Set;

import org.ngbw.sdk.UserAuthenticationException;
import org.ngbw.sdk.core.shared.UserRole;
import org.ngbw.sdk.database.Group;
import org.ngbw.sdk.database.User;
import org.ngbw.web.controllers.FolderController;
import org.apache.log4j.Logger;

/**
 * Struts action class to process all user profile-related requests
 * in the NGBW web application.
 * 
 * @author Jeremy Carver
 */
@SuppressWarnings("serial")
public class ProfileManager extends SessionManager
{
	private static final Logger logger = Logger.getLogger(ProfileManager.class.getName());
	/*================================================================
	 * Action methods
	 *================================================================*/
	public String input() {
		populateProfileForm();
		return INPUT;
	}
	
	public String updatePassword() {
		if (validatePassword()) try {
			if (getController().editPassword(getCurrentPassword(),
				getNewPassword())) {
				addActionMessage("Password successfully updated.");
				return SUCCESS;
			} else return INPUT;
		} catch (UserAuthenticationException error) {
			addFieldError("currentPassword", error.getMessage());
			return INPUT;
		} else return INPUT;
	}
	
	public String updatePersonalInformation() {
		if (validatePersonalInformation()) {
			if (getController().editUser(getEmail(), getFirstName(),
				getLastName(), getOrganization(), getAccount())) {
				addActionMessage("Personal information successfully updated.");
				return SUCCESS;
			} else return INPUT;
		} else return INPUT;
	}
	
	/*================================================================
	 * Public property accessor methods
	 *================================================================*/
	public UserRole getAuthenticatedUserRole() {
		FolderController controller = getFolderController();
		if (controller == null)
			return null;
		else return controller.getAuthenticatedUserRole();
	}
	
	public Set<Group> getAuthenticatedUserGroups() {
		FolderController controller = getFolderController();
		if (controller == null)
			return null;
		else return controller.getAuthenticatedUserGroups();
	}
	
	/*================================================================
	 * Convenience methods
	 *================================================================*/
	protected boolean validatePassword() {
		String currentPassword = getCurrentPassword();
		if (currentPassword == null || currentPassword.trim().equals("")) {
			addFieldError("currentPassword", "Current Password is required.");
		}
		String newPassword = getNewPassword();
		if (newPassword == null || newPassword.trim().equals("")) {
			addFieldError("newPassword", "New Password is required.");
		} else if (newPassword.equals(getConfirmNewPassword()) == false) {
			addFieldError("confirmNewPassword",
				"Sorry, the passwords you entered aren't identical.  Please try again.");
		}
		if (hasFieldErrors())
			return false;
		else return true;
	}
	
	protected boolean validatePersonalInformation() {
		String firstName = getFirstName();
		if (firstName == null || firstName.trim().equals("")) {
			addFieldError("firstName", "First Name is required.");
		}
		String lastName = getLastName();
		if (lastName == null || lastName.trim().equals("")) {
			addFieldError("lastName", "Last Name is required.");
		}
		String email = getEmail();
		String oldEmail = getAuthenticatedUser().getEmail();
		if (email == null || email.trim().equals("")) {
			addFieldError("email", "Email is required.");
		} else if (email.equals(oldEmail)) {
			String confirmEmail = getConfirmEmail();
			if (confirmEmail != null && confirmEmail.trim().equals("") == false &&
				email.equals(confirmEmail) == false) {
				addFieldError("confirmEmail", "Sorry, the email addresses you entered " +
					"aren't identical.  Please try again.");
			}
		} else if (email.equals(getConfirmEmail()) == false) {
			addFieldError("confirmEmail", "Sorry, the email addresses you entered " +
				"aren't identical.  Please try again.");
		}
		if (hasFieldErrors())
			return false;
		else return true;
	}
	
	private void populateProfileForm() {
		User user = getAuthenticatedUser();
		if (user == null)
			return;
		else {
			setFirstName(user.getFirstName());
			setLastName(user.getLastName());
			setEmail(user.getEmail());
			setOrganization(user.getInstitution());
			setAccount(user.getAccount("teragrid"));
		}
	}
}
