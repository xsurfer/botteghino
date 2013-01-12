
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
@WebService(name = "HelloWorldService", targetNamespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/HelloWorldService")
@XmlSeeAlso({
    ObjectFactory.class
})
public interface HelloWorldService {


    /**
     * 
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "sayHello", targetNamespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/HelloWorldService", className = "it.fperfetti.asos.botteghino.stub.SayHello")
    @ResponseWrapper(localName = "sayHelloResponse", targetNamespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/HelloWorldService", className = "it.fperfetti.asos.botteghino.stub.SayHelloResponse")
    public String sayHello();

    /**
     * 
     * @param arg0
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "sayHelloToName", targetNamespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/HelloWorldService", className = "it.fperfetti.asos.botteghino.stub.SayHelloToName")
    @ResponseWrapper(localName = "sayHelloToNameResponse", targetNamespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/HelloWorldService", className = "it.fperfetti.asos.botteghino.stub.SayHelloToNameResponse")
    public String sayHelloToName(
        @WebParam(name = "arg0", targetNamespace = "")
        String arg0);

    /**
     * 
     * @return
     *     returns java.util.List<it.fperfetti.asos.botteghino.stub.Event>
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "getEvents", targetNamespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/HelloWorldService", className = "it.fperfetti.asos.botteghino.stub.GetEvents")
    @ResponseWrapper(localName = "getEventsResponse", targetNamespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/HelloWorldService", className = "it.fperfetti.asos.botteghino.stub.GetEventsResponse")
    public List<Event> getEvents();

    /**
     * 
     * @param arg0
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "sayHelloToNames", targetNamespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/HelloWorldService", className = "it.fperfetti.asos.botteghino.stub.SayHelloToNames")
    @ResponseWrapper(localName = "sayHelloToNamesResponse", targetNamespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/HelloWorldService", className = "it.fperfetti.asos.botteghino.stub.SayHelloToNamesResponse")
    public String sayHelloToNames(
        @WebParam(name = "arg0", targetNamespace = "")
        List<String> arg0);

}