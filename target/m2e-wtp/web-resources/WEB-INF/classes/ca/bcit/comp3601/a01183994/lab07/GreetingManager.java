package ca.bcit.comp3601.a01183994.lab07;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletContext;

public class GreetingManager {
	private static GreetingManager instance;
	private String inputMessage;
	private String welcomeMessage;

	public GreetingManager(ServletContext context) {
		this.inputMessage = context.getInitParameter("inputMessage");
		this.welcomeMessage = context.getInitParameter("welcomeMessage");
	}

	public static synchronized GreetingManager getInstance(ServletContext context) {
		if (instance == null) {
			instance = new GreetingManager(context);
		}
		return instance;
	}

	public String getInputMessage() {
		return inputMessage;
	}

	public String getWelcomeMessage(final String name) {
	    final String capitalizedName = capitalizeFirstLetter(name);
	    return String.format("Hello <span class=\"txt-blue\">%s</span>, %s", capitalizedName, welcomeMessage);
	}

	public String capitalizeFirstLetter(final String name) {
	    if (name == null || name.isEmpty()) {
	        return name; // Return as is if null or empty
	    }
	    return Character.toUpperCase(name.charAt(0)) + name.substring(1).toLowerCase();
	}

	public String getCurrentDateTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss yyyy z");
		return sdf.format(new Date());
	}

	public boolean isValidName(String name) {
		return name != null && !name.trim().isEmpty();
	}
}