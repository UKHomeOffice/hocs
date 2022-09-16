workspace "DECS (Digital External Correspondence System)" {

    model {

        user = person "Home Office Employee" "A member of an internal team that has been onboarded"
        hof = softwareSystem "Home Office Forms" "Online public-facing forms that capture basic case information e.g. UKVI (United Kingdom Visas & Immigration) complaints"
        decs = softwareSystem "DECS"

        user -> decs "Uses"
        hof -> decs "Initiates a case with"
    }

    views {
        systemContext decs "Diagram1" {
            include *
            autoLayout
        }

        theme default
    }

}