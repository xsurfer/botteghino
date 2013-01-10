
package it.fperfetti.asos.botteghino.stub;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the it.fperfetti.asos.botteghino.stub package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _SayHelloToNameResponse_QNAME = new QName("http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/HelloWorldService", "sayHelloToNameResponse");
    private final static QName _SayHelloToNamesResponse_QNAME = new QName("http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/HelloWorldService", "sayHelloToNamesResponse");
    private final static QName _SayHelloToName_QNAME = new QName("http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/HelloWorldService", "sayHelloToName");
    private final static QName _SayHelloToNames_QNAME = new QName("http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/HelloWorldService", "sayHelloToNames");
    private final static QName _SayHello_QNAME = new QName("http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/HelloWorldService", "sayHello");
    private final static QName _SayHelloResponse_QNAME = new QName("http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/HelloWorldService", "sayHelloResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: it.fperfetti.asos.botteghino.stub
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link SayHelloToNameResponse }
     * 
     */
    public SayHelloToNameResponse createSayHelloToNameResponse() {
        return new SayHelloToNameResponse();
    }

    /**
     * Create an instance of {@link SayHelloToNamesResponse }
     * 
     */
    public SayHelloToNamesResponse createSayHelloToNamesResponse() {
        return new SayHelloToNamesResponse();
    }

    /**
     * Create an instance of {@link SayHelloToNames }
     * 
     */
    public SayHelloToNames createSayHelloToNames() {
        return new SayHelloToNames();
    }

    /**
     * Create an instance of {@link SayHelloResponse }
     * 
     */
    public SayHelloResponse createSayHelloResponse() {
        return new SayHelloResponse();
    }

    /**
     * Create an instance of {@link SayHello }
     * 
     */
    public SayHello createSayHello() {
        return new SayHello();
    }

    /**
     * Create an instance of {@link SayHelloToName }
     * 
     */
    public SayHelloToName createSayHelloToName() {
        return new SayHelloToName();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SayHelloToNameResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/HelloWorldService", name = "sayHelloToNameResponse")
    public JAXBElement<SayHelloToNameResponse> createSayHelloToNameResponse(SayHelloToNameResponse value) {
        return new JAXBElement<SayHelloToNameResponse>(_SayHelloToNameResponse_QNAME, SayHelloToNameResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SayHelloToNamesResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/HelloWorldService", name = "sayHelloToNamesResponse")
    public JAXBElement<SayHelloToNamesResponse> createSayHelloToNamesResponse(SayHelloToNamesResponse value) {
        return new JAXBElement<SayHelloToNamesResponse>(_SayHelloToNamesResponse_QNAME, SayHelloToNamesResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SayHelloToName }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/HelloWorldService", name = "sayHelloToName")
    public JAXBElement<SayHelloToName> createSayHelloToName(SayHelloToName value) {
        return new JAXBElement<SayHelloToName>(_SayHelloToName_QNAME, SayHelloToName.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SayHelloToNames }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/HelloWorldService", name = "sayHelloToNames")
    public JAXBElement<SayHelloToNames> createSayHelloToNames(SayHelloToNames value) {
        return new JAXBElement<SayHelloToNames>(_SayHelloToNames_QNAME, SayHelloToNames.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SayHello }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/HelloWorldService", name = "sayHello")
    public JAXBElement<SayHello> createSayHello(SayHello value) {
        return new JAXBElement<SayHello>(_SayHello_QNAME, SayHello.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SayHelloResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://fornitore-paasfab.rhcloud.com/jboss-as-helloworld-ws/HelloWorldService", name = "sayHelloResponse")
    public JAXBElement<SayHelloResponse> createSayHelloResponse(SayHelloResponse value) {
        return new JAXBElement<SayHelloResponse>(_SayHelloResponse_QNAME, SayHelloResponse.class, null, value);
    }

}
