# Testing the M2E discovery catalog

### Update the catalog with your entry

Clone the Git repository containing the catalog entries and publishing mechanism:

```
git clone git@github.com:tesla/m2e-discovery-catalog.git
```

Edit the connectors.xml file with your catalog entry which is [here][1].

### Build the catalog

In the top level of the Git repository execute the following command:

```
mvn clean package
```

This will create the catalog and validate that all the update sites specified are accessible.

## Test your connector with Eclipse

Specify your newly built catalog by updating the eclipse.ini file in your Eclipse installation

```
-vmargs
...
-Dm2e.discovery.url=http://download.eclipse.org/technology/m2e/discovery/directory-test-1.1.xml                                                                              
```

Your `eclipse.ini` will look something like [this][2].

Once you have tested your connector and feel that it's working as intended then submit a pull request and we will merge your catalog entry and publish a new catalog

```
<directory xmlns="http://www.eclipse.org/mylyn/discovery/directory/">
  <entry url="http://repository.tesla.io:8081/nexus/content/sites/m2e.discovery.stage/org.eclipse.m2e.discovery.oss-catalog-1.1.jar" permitCategories="true"/>
</directory>
```

[1]: https://github.com/tesla/m2e-discovery-catalog/blob/master/org.eclipse.m2e.discovery.oss/connectors.xml
[2]: https://gist.github.com/3774140