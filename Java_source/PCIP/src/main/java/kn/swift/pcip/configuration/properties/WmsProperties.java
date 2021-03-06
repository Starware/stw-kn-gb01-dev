package kn.swift.pcip.configuration.properties;



import lombok.Getter;
import lombok.Setter;

@Getter
public class WmsProperties {
	
	private final Connection connection = new Connection();
	private final Jms jms = new Jms();

	@Getter
	@Setter
	public static class Connection {
		private String url;
		private String user;
		private String password;
	}

	@Getter
	@Setter
	public static class Jms {
		private String broker;
		private String destination;
	}
}
