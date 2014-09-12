# Testing the M2E discovery catalog - for users

### Test the staged connector catalog

If you know that one of the connectors you use has been updated in the staging catalog then you can try the new connector by specifying the staged catalog during the startup of Eclipse. by updating the eclipse.ini file in your Eclipse installation:

```
-vmargs
...
...
-Dm2e.discovery.url=http://download.eclipse.org/technology/m2e/discovery/directory-test-1.1.xml                                                                         
```

# Testing the M2E discovery catalog - for connector devs

This guide is for developers creating connectors for M2E. While we would like to fully streamline the process of testing and pushing connectors into the publicly available catalog, this is what we have right now. As a developer of a connector, with the following instructions, you should be able to build the catalog locally with your changes and test that your connector is available from a publicly accessible site, will install, and works as expected.

### Update the catalog with your entry

Clone the Git repository containing the catalog entries and publishing mechanism:

```
git clone git@github.com:takari/m2e-discovery-catalog.git
```

Edit the connectors.xml file with your catalog entry which is [here][1].

### Build the catalog

In the top level of the Git repository execute the following command:

```
mvn clean package
```

This will create the catalog and validate that all the update sites specified are accessible. This will also produce two catalog files that you can use for testing locally with only the file system.

### Test your connector with Eclipse

Specify your newly built catalog by updating the eclipse.ini file in your Eclipse installation:

```
-vmargs
...
...

-Dm2e.discovery.url=file:/path/to/m2e-discovery-catalog/org.eclipse.m2e.discovery.oss/target/classes/catalog-1.1.xml                                                                              
```
Once you have tested your connector and feel that it's working as intended then submit a pull request and we will merge your catalog entry and publish a new catalog.

[1]: https://github.com/takari/m2e-discovery-catalog/blob/master/org.eclipse.m2e.discovery.oss/src/main/resources-filtered/connectors.xml
