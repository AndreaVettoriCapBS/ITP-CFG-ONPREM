Codeunit 18100605 "CFG Item Attributes Conf."//18100605
{
    trigger OnRun()
    begin
    end;

    var
        GArray: array[100] of Integer;
        EntryNoArray: array[100] of Integer;
        AttributeArray: array[100] of Boolean;
        OptionArray: array[100] of Boolean;
        ItemConfSetup: Record "CFG Item Configurator Code";
        pg50003: Page "CFG Create Item";
        txtCharacterNo: label 'The value of the first "No. Character" has to be 1.';
        Dim: Integer;
        i: Integer;
        IntAux: Integer;
        rcField: Record "Field";
        FieldNameArray: array[100] of Text;
        BlProcSyst: Boolean;
        optItemType: Integer;
        indexAux: Integer;
        "Count": Integer;
        CountValue: Integer;
        AssignValue: array[100] of Boolean;
        ProgressiveArray: array[100] of Integer;
        Progressive: Integer;
        IsBOM: Boolean;
        ItemAttribute: Record "Item Attribute";

    procedure GenerateConfiguratorArray(var RcTmpAux: Record "Purchase Line" temporary): Integer
    var
        FieldsList: Record Field;
    begin
        RcTmpAux.Reset;
        Clear(GArray);
        Clear(ProgressiveArray);
        Clear(EntryNoArray);
        Clear(AttributeArray);
        ItemConfSetup.Reset;
        if (BlProcSyst = true) then
            ItemConfSetup.SetRange("Procurement System", ItemConfSetup."procurement system"::Purchase)
        else
            if (BlProcSyst = false) then begin
                if IsBOM then
                    ItemConfSetup.SetRange("Procurement System", ItemConfSetup."procurement system"::"Production BOM")
                else
                    ItemConfSetup.SetRange("Procurement System", ItemConfSetup."procurement system"::"Prod. Order");
            end;
        ItemConfSetup.SetRange("Item Type", optItemType);
        Dim := ItemConfSetup.Count;
        ItemConfSetup.SetCurrentkey("Field Name", "Character No.");
        indexAux := 1;
        Count := 20;
        CountValue := 71;
        Progressive := 0;
        if ItemConfSetup.FindSet then
            if (ItemConfSetup."Character No." <> 0) and (ItemConfSetup."Character No." > 0) then
                for i := 1 to Dim do begin
                    if ItemConfSetup."Field Name" = ItemConfSetup."field name"::Description then begin
                        Count += 1;
                        indexAux := Count;
                    end;
                    if ItemConfSetup."Field Name" = ItemConfSetup."field name"::Value then begin
                        CountValue += 1;
                        indexAux := CountValue;
                    end;
                    GArray[indexAux] := ItemConfSetup."Field No.";
                    FieldNameArray[indexAux] := Format(ItemConfSetup."Field Name");
                    EntryNoArray[indexAux] := ItemConfSetup."Entry No.";
                    AttributeArray[indexAux] := ItemConfSetup."Field Type" = ItemConfSetup."Field Type"::Attribute;
                    if not AttributeArray[indexAux] then begin
                        FieldsList.SetRange(TableNo, ItemConfSetup."Table No.");
                        FieldsList.SetRange("No.", ItemConfSetup."Field No.");
                        FieldsList.FindFirst();
                        OptionArray[indexAux] := FieldsList.Type = FieldsList.Type::Option;
                    end;

                    if (ItemConfSetup.Progressive = true) then begin
                        ProgressiveArray[indexAux] := ItemConfSetup."Field No.";
                    end;

                    if ItemConfSetup."Insert Value" then
                        AssignValue[indexAux] := true;
                    ItemConfSetup.Next;
                    indexAux := i;
                    indexAux += 1;
                end
            else
                Error(txtCharacterNo);

        for i := 1 to CountValue do begin
            RcTmpAux."Allow Invoice Disc." := false;
            if GArray[i] <> 0 then begin
                if not AttributeArray[i] then begin
                    rcField.Reset;
                    rcField.SetRange(TableNo, 27);
                    rcField.SetRange("No.", GArray[i]);
                    if rcField.FindFirst then begin
                        RcTmpAux.Init;
                        RcTmpAux."Document Type" := RcTmpAux."document type"::Order;
                        RcTmpAux."Document No." := 'TMP';
                        RcTmpAux."Line No." := i;
                        RcTmpAux.Description := rcField."Field Caption";
                        RcTmpAux."Description 2" := FieldNameArray[i];
                        RcTmpAux.Insert(false);
                    end;
                end
                else begin
                    if ItemAttribute.get(GArray[i]) then begin
                        RcTmpAux.Init;
                        RcTmpAux."Document Type" := RcTmpAux."document type"::Order;
                        RcTmpAux."Document No." := 'TMP';
                        RcTmpAux."Line No." := i;
                        RcTmpAux.Description := ItemAttribute.Name;
                        RcTmpAux."Description 2" := FieldNameArray[i];
                        RcTmpAux."System-Created Entry" := TRUE;
                        RcTmpAux.Insert(false);
                    end;
                end;
            end;
        end;
    end;

    procedure SaveArray(var PArray: array[100] of Integer; var PFieldArray: array[100] of Text; var PEntryNoArray: array[100] of Integer; var PAssignArray: array[100] of Boolean; var PProgressive: array[100] of Integer; var PAttributeArray: array[100] of Boolean; var POptionArray: array[100] of boolean)
    begin
        for i := 1 to 100 do begin
            PArray[i] := GArray[i];
            PFieldArray[i] := FieldNameArray[i];
            PEntryNoArray[i] := EntryNoArray[i];
            PAssignArray[i] := AssignValue[i];
            PProgressive[i] := ProgressiveArray[i];
            PAttributeArray[i] := AttributeArray[i];
            POptionArray[i] := OptionArray[i];
        end;
    end;

    procedure SetProcSystem(IBoolean: Boolean; IoptType: Integer)
    begin
        BlProcSyst := IBoolean;
        optItemType := IoptType;
    end;

    procedure SetBOM(IoptType: Integer)
    begin
        IsBOM := true;
        optItemType := IoptType;
    end;
}

