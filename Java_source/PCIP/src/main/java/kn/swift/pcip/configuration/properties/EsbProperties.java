package kn.swift.pcip.configuration.properties;



import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EsbProperties {

	private static final EsbProperties ESB_PROPERTIES = new EsbProperties();

	private EsbProperties(){}

	public static EsbProperties getInstance(){
		return ESB_PROPERTIES;
	}

	private String url;
	private String pcipBasePath;
	private String user;
	private String password;
	
}
