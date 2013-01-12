/*
 * $Id: HelloWorld.java 739661 2009-02-01 00:06:00Z davenewton $
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package it.fperfetti.asos.botteghino.action;

import java.util.ArrayList;

import it.fperfetti.asos.botteghino.stub.Event;
import it.fperfetti.asos.botteghino.stub.HelloWorldService;
import it.fperfetti.asos.botteghino.stub.HelloWorldService_Service;


/**
 * <code>Set welcome message.</code>
 */
public class Home extends ExampleSupport {

	private ArrayList<Event> events;
	
    public String execute() throws Exception {
    	
    	HelloWorldService eP = new HelloWorldService_Service().getHelloWorld();    		
        setEvents((ArrayList<Event>) eP.getEvents());
        return SUCCESS;
    }

    public ArrayList<Event> getEvents() {
        return events;
    }

    public void setEvents(ArrayList<Event> events) {
        this.events = events;
    }
}
