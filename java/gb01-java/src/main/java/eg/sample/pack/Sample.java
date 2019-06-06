package eg.sample.pack;

import com.google.common.collect.BiMap;
import com.google.common.collect.HashBiMap;
import com.redprairie.moca.SimpleResults;
import uk.org.binky.lexinator.Token;;

/**
 * A sample class for deployment to a JDA server.
 * 
 * It has compile time dependencies on JDA libraries but does not 
 * deploy these libraries as they will be provided by the JDA runtime on
 * the target environment.
 * 
 * Wherever possible the same approach should be taken with any other (3rd party) 
 * jars that are included in the JDA runtime.  
 * @author andrew.partington
 *
 */
public class Sample extends SimpleResults{

	
	/**
	 * serialisation support
	 */
	private static final long serialVersionUID = 1L;

	public enum MyEnum{
		SUNDAY, MONDAY, TUESDAY, WEDNESDAY,
	    THURSDAY, FRIDAY, SATURDAY
	}
	
	public static void main(String[] args) {
		BiMap<String, Integer> uniqueMap = HashBiMap.create();
		uniqueMap.put("key 1", 1);
		uniqueMap.put("key 2", 2);
		Token<MyEnum> fridayToken = new Token<>("", 0, MyEnum.FRIDAY, "value");
		if(fridayToken.value.equals(args[0])) {
			// do something
		}
	}

}
