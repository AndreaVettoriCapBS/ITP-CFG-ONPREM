Table 18100610 "CFG Item Configurator Setup"//18100610
{
    Caption = 'Item Configurator Setup';

    fields
    {
        field(10; "Primary Key"; Code[10])
        {
        }
        field(20; "Purchase Serial No."; Code[20])
        {
            Caption = 'Purchase Serial No.';
            TableRelation = "No. Series";
        }
        field(30; "Prod. Order Serial No."; Code[20])
        {
            Caption = 'Prod. Order Serial No.';
            TableRelation = "No. Series";
        }
        field(40; "Prod. Item Tracking No."; Code[20])
        {
            Caption = 'Prod. Item Tracking No.';
            TableRelation = "Item Tracking Code";
        }
        field(50; "Purch. Item Tracking No."; Code[20])
        {
            Caption = 'Purch. Item Tracking No.';
            TableRelation = "Item Tracking Code";
        }
        field(60; "Prod. BOM Serial No."; Code[20])
        {
            Caption = 'Prod. BOM Serial No.';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
        }
    }

    fieldgroups
    {
    }
}

