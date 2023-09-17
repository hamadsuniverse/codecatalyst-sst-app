workspace "Amazon Web Services Example" "An example AWS deployment architecture." {

    model {

        
        petClinicSystem = softwaresystem "Pet Clinic System" "Allows employees to view and manage information regarding the veterinarians, the clients, and their pets." {
            !docs docs
            !adrs adrs
            
            webApplication = container "Web Application" "Allows employees to view and manage information regarding the veterinarians, the clients, and their pets." "Java and Spring Boot" {
                tags "Application"
            }
            database = container "Database" "Stores information regarding the veterinarians, the clients, and their pets." "Relational database schema" {
                tags "Database"
            }
        }

        user = person "User"
        
        webApplication -> database "Reads from and writes to" "MySQL Protocol/SSL"

        user -> webApplication "Accesses"

        prod = deploymentEnvironment "Production" {

            deploymentNode "Amazon Web Services" {
                tags "Amazon Web Services - Cloud"

                region = deploymentNode "US-East-1" {
                    tags "Amazon Web Services - Region"

                    route53 = infrastructureNode "Route 53" {
                        description "Highly available and scalable cloud DNS service."
                        tags "Amazon Web Services - Route 53"
                    }

                    vpc = deploymentNode "VPC" {
                        tags "Amazon Web Services - Virtual Private Cloud"

                        publicSubnet = deploymentNode "Public Subnet" {
                            elb = infrastructureNode "Elastic Load Balancer" {
                                description "Automatically distributes incoming application traffic."
                                tags "Amazon Web Services - Elastic Load Balancing"
                            }
                        }
                        privateSubnet = deploymentNode "Private Subnet" {
                            deploymentNode "Autoscaling group" {
                                tags "Amazon Web Services - Auto Scaling"

                                deploymentNode "Amazon EC2" {
                                    tags "Amazon Web Services - EC2"

                                    webApplicationInstance = containerInstance webApplication
                                }
                            }

                            deploymentNode "Amazon RDS" {
                                tags "Amazon Web Services - RDS"

                                deploymentNode "MySQL" {
                                    tags "Amazon Web Services - RDS MySQL instance"

                                    databaseInstance = containerInstance database
                                }
                            }
                        }
                    }
                }
            }

            route53 -> elb "Forwards requests to" "HTTPS"
            elb -> webApplicationInstance "Forwards requests to" "HTTPS"
        }
    }

    views {
        deployment petClinicSystem "Production" "AmazonWebServicesDeployment" {
            include *
            autolayout lr
        }

        container petClinicSystem "containerView" {
            include *
            autolayout lr
        }

        systemcontext petClinicSystem "contextView" {
            include *
            autolayout lr
        }

        styles {
            element "Element" {
                shape roundedbox
                background #ffffff
            }
            element "Container" {
                background #ffffff
            }
            element "Application" {
                background #ffffff
            }
            element "Database" {
                shape cylinder
            }
        }

        themes https://static.structurizr.com/themes/amazon-web-services-2023.01.31/theme.json
    }

}