workspace "DECS (Digital External Correspondence System)" {

    model {
        user = person "Home Office Employee" "A member of an internal team that is onboarded"
        decs = softwareSystem "DECS"

        user -> decs "Uses"
    }

    views {
        systemContext decs "Diagram1" {
            include *
            autoLayout
        }

        theme default
    }

}