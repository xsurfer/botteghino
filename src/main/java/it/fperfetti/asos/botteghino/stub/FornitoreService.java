
package it.fperfetti.asos.botteghino.stub;

import java.util.List;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.4-b01
 * Generated source version: 2.2
 * 
 */
@WebService(name = "FornitoreService", targetNamespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/FornitoreService")
@XmlSeeAlso({
    ObjectFactory.class
})
public interface FornitoreService {


    /**
     * 
     * @param arg0
     * @return
     *     returns it.fperfetti.asos.botteghino.stub.Event
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "getEvent", targetNamespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/FornitoreService", className = "it.fperfetti.asos.botteghino.stub.GetEvent")
    @ResponseWrapper(localName = "getEventResponse", targetNamespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/FornitoreService", className = "it.fperfetti.asos.botteghino.stub.GetEventResponse")
    public Event getEvent(
        @WebParam(name = "arg0", targetNamespace = "")
        Integer arg0);

    /**
     * 
     * @return
     *     returns java.util.List<it.fperfetti.asos.botteghino.stub.Category>
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "getCategories", targetNamespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/FornitoreService", className = "it.fperfetti.asos.botteghino.stub.GetCategories")
    @ResponseWrapper(localName = "getCategoriesResponse", targetNamespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/FornitoreService", className = "it.fperfetti.asos.botteghino.stub.GetCategoriesResponse")
    public List<Category> getCategories();

    /**
     * 
     * @param arg0
     * @return
     *     returns java.util.List<it.fperfetti.asos.botteghino.stub.Event>
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "getEventsByCategory", targetNamespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/FornitoreService", className = "it.fperfetti.asos.botteghino.stub.GetEventsByCategory")
    @ResponseWrapper(localName = "getEventsByCategoryResponse", targetNamespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/FornitoreService", className = "it.fperfetti.asos.botteghino.stub.GetEventsByCategoryResponse")
    public List<Event> getEventsByCategory(
        @WebParam(name = "arg0", targetNamespace = "")
        String arg0);

    /**
     * 
     * @return
     *     returns java.util.List<it.fperfetti.asos.botteghino.stub.Event>
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "getEvents", targetNamespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/FornitoreService", className = "it.fperfetti.asos.botteghino.stub.GetEvents")
    @ResponseWrapper(localName = "getEventsResponse", targetNamespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/FornitoreService", className = "it.fperfetti.asos.botteghino.stub.GetEventsResponse")
    public List<Event> getEvents();

}