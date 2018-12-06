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
  of skConst: "const " & (if suggest.qualifiedPath.len != 0: suggest.qualifiedPath.join(".") else: "") & ": " & suggest.forth
  of skEnumField: "enum " & suggest.forth
  of skForVar: "for var of " & suggest.forth
  of skIterator: suggest.forth
  of skLabel: "label"
  of skLet: "let of " & suggest.forth
  of skMacro: "macro"
  of skMethod: suggest.forth
  of skParam: "param"
  of skProc: suggest.forth
  of skResult: "result"
  of skTemplate: suggest.forth
  of skType: "type " & suggest.qualifiedPath[0]
  of skVar: "var of " & suggest.forth
  else: suggest.forth

func nimDocstring(suggest: Suggest): string =
  suggest.doc.unescape()
