package kn.swift.moca.utils;

import kn.swift.pcip.configuration.properties.EsbProperties;
import kn.swift.pcip.configuration.properties.PcipProperties;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import static org.junit.Assert.*;

public class PropertyUpdaterTest {

    EsbProperties esbProperties;
    PcipProperties pcipProperties;

    @Before
    public void setUp(){




    }

    @Test
    @Ignore
    public void updatePcipProperties() {

        PropertyUpdater updater = new PropertyUpdater();

        updater.updatePcipProperties("url","culture","user","password","appID","key1","key2","key3","key4");

        EsbProperties esbProperties = EsbProperties.getInstance();

        assertEquals("url", esbProperties.getUrl());
        //assertEquals("key1",pcipProperties.getXpath().getWarehouseId());

    }
}