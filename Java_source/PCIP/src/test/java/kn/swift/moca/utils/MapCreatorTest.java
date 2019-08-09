package kn.swift.moca.utils;


import kn.swift.moca.utils.*;

//import static org.hamcrest.Matchers.*;
import static org.hamcrest.MatcherAssert.assertThat;

import org.hamcrest.Description;
import org.hamcrest.Matcher;
import org.hamcrest.TypeSafeMatcher;
//import org.hamcrest.collection.IsMapContaining;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

import static org.hamcrest.core.AllOf.allOf;
import static org.junit.Assert.*;
@Ignore
public class MapCreatorTest {

    MapCreator mapCreator;

    @Before
    public void setMapCreator(){

        mapCreator = new MapCreator();

    }



    @Test
    public void createReprintRequestMapSize(){
        Map<String,String> testMap = mapCreator.createReprintRequestMap("client","depot","carcod","invtid","output","operation");

        assertEquals(testMap.size(),6);
    }

}