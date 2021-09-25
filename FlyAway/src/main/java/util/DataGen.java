package util;

import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.hibernate.ObjectNotFoundException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class DataGen {

	//Immutable field which returns all the states in US with code and Name:
    private final Map<String, String> mapOfUSStates = USConstants.mapOfUSStates;
    //Immutable field which returns all the states in US with only code:
    private final List<String> listOfUSStatesCode = USConstants.listOfUSStatesCode;

    public Map<String, String> getMapOfUSStates() {
        return mapOfUSStates;
    }

    public final List<String> getListOfUSStatesCode() {
        Collections.sort(listOfUSStatesCode);
        return listOfUSStatesCode;
    }

    public String getStateName(String code) {

        String name = null;
        if (mapOfUSStates != null && !mapOfUSStates.isEmpty()) {
            name = mapOfUSStates.get(code);
        }
        return name;
    }
    
    
	

}
