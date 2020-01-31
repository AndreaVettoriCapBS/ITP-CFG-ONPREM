Page 18100611 "CFG Item Configurator Setup"//18100611
{
    Caption = 'Item Configurator Setup';
    PageType = Card;
    SourceTable = "CFG Item Configurator Setup";
    UsageCategory = Administration;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            group(Generale)
            {
                field("Purchase Serial No."; "Purchase Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("Prod. Order Serial No."; "Prod. Order Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("Prod. BOM Serial No."; "Prod. BOM Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("Prod. Item Tracking No."; "Prod. Item Tracking No.")
                {
                    ApplicationArea = Basic;
                }
                field("Purch. Item Tracking No."; "Purch. Item Tracking No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

