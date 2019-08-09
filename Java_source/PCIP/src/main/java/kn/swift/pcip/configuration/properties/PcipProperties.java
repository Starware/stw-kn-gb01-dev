package kn.swift.pcip.configuration.properties;

import com.redprairie.moca.MocaContext;
import com.redprairie.moca.util.MocaUtils;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PcipProperties {

	private static final PcipProperties PCIP_PROPERTIES = new PcipProperties();

	private PcipProperties(){};

	public static PcipProperties getInstance(){

		MocaContext moca = MocaUtils.currentContext();

		moca.trace("getting pcip properties file");

		return PCIP_PROPERTIES;
	}

	private final AuthHeader authHeader = new AuthHeader();
	private final Parcel parcel = new Parcel();
	private final Xpath xpath = new Xpath();
	private final Jaxb jaxb	= new Jaxb();
	private String appId;
	private String uri;
	private String basePath;
	private String authBasePath;

	@Getter
	@Setter
	public static class Jaxb {
		private String contextPath;
	}

	@Getter
	@Setter
	public static class Xpath {
		private String parcelId;
		private String clientId;
		private String warehouseId;
		private String shipmentRefno;
		private String knSscc;
		private String knLoadId;
		private String knCarrierId;
	}

	@Getter
	@Setter
	public static class Parcel {
		private String identifier;
		private String externalRefs;
		private String refno;
	}

	@Getter
	@Setter
	public static class AuthHeader {
		private String culture;
		private String user;
		private String password;
	}
}
