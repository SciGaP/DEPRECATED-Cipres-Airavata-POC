/*
 * AddTestUser.java
 */
package org.ngbw.utils;


import java.util.Iterator;

import org.ngbw.sdk.core.shared.UserRole;
import org.ngbw.sdk.database.ConnectionManager;
import org.ngbw.sdk.database.DriverConnectionSource;
import org.ngbw.sdk.database.Folder;
import org.ngbw.sdk.database.User;


/**
 * 
 * @author Paul Hoover
 *
 */
public class AddTestUser {


	public static void main(String[] args)
	{
		try {
			ConnectionManager.setConnectionSource(new DriverConnectionSource());

			String username = "t";
			User newUser = User.findUserByUsername(username);

			if (newUser == null) {
				newUser = new User();

				newUser.setUsername(username);
				newUser.setPassword(username);
				newUser.setEmail("abc@def.ghi");
				newUser.setFirstName(username);
				newUser.setLastName(username);
				newUser.setRole(UserRole.STANDARD);

				newUser.save();
			}

			String folderLabel = "Test Folder";
			Folder newFolder = null;

			for (Iterator<Folder> folders = newUser.findFolders().iterator() ; folders.hasNext() ; ) {
				Folder entry = folders.next();

				if (entry.getLabel().equals(folderLabel)) {
					newFolder = entry;

					break;
				}
			}

			if (newFolder == null) {
				newFolder = new Folder(newUser);

				newFolder.setLabel(folderLabel);

				newFolder.save();
			}

			System.out.println("finsihed");
		}
		catch (Exception err) {
			err.printStackTrace(System.err);

			System.exit(-1);
		}
	}
}
