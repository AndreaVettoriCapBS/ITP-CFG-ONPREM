Table 18100606 "CFG Item Creation"//18100606
{
    Caption = 'Item Creation';

    fields
    {
        field(1; "Category Item Code"; Code[10])
        {
            Caption = 'Category Item Code';
            TableRelation = "Item Category".Code;
        }
        field(2; "Base Unit of Measure"; Code[10])
        {
            Caption = 'Base Unit of Measure';
            TableRelation = "Unit of Measure";
        }
    }

    keys
    {
        key(Key1; "Category Item Code", "Base Unit of Measure")
        {
        }
    }

    fieldgroups
    {
    }
}

