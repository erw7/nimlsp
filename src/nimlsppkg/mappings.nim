func nimSymToLSPKind(suggest: Suggest): CompletionItemKind =
  case suggest.symkind.TSymKind:
  of skConst: CompletionItemKind.Value
  of skEnumField: CompletionItemKind.Enum
  of skForVar: CompletionItemKind.Variable
  of skIterator: CompletionItemKind.Keyword
  of skLabel: CompletionItemKind.Keyword
  of skLet: CompletionItemKind.Value
  of skMacro: CompletionItemKind.Snippet
  of skMethod: CompletionItemKind.Method
  of skParam: CompletionItemKind.Variable
  of skProc: CompletionItemKind.Function
  of skResult: CompletionItemKind.Value
  of skTemplate: CompletionItemKind.Snippet
  of skType: CompletionItemKind.Class
  of skVar: CompletionItemKind.Field
  of skFunc: CompletionItemKind.Function
  else: CompletionItemKind.Property

func nimSymDetails(suggest: Suggest): string =
  case suggest.symkind.TSymKind:
  of skConst: "const " & suggest.qualifiedPath[0] & ": " & cast[string](suggest.name)
  of skEnumField: "enum " & cast[string](suggest.name)
  of skForVar: "for var of " & cast[string](suggest.name)
  of skIterator: cast[string](suggest.name)
  of skLabel: "label"
  of skLet: "let of " & cast[string](suggest.name)
  of skMacro: "macro"
  of skMethod: cast[string](suggest.name)
  of skParam: "param"
  of skProc: cast[string](suggest.name)
  of skResult: "result"
  of skTemplate: cast[string](suggest.name)
  of skType: "type " & suggest.qualifiedPath[0]
  of skVar: "var of " & cast[string](suggest.name)
  else: cast[string](suggest.name)

func nimDocstring(suggest: Suggest): string =
  suggest.doc.unescape()
