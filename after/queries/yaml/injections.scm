; extends

; Heuristic: inject bash into block scalars containing common shell commands,
; regardless of the key name (catches keys not covered by the built-in).
(block_mapping_pair
  value: (block_node
    (block_scalar) @injection.content
    (#match? @injection.content "(ls|git|cd|echo|source|fi|done|apt|yum|brew|mkdir|rm|cp|mv|chmod|chown|curl|wget)(\s|$)")
    (#set! injection.language "bash")
    (#offset! @injection.content 0 1 0 0)))

; Heuristic: inject python into block scalars containing common Python syntax.
; Excludes 'import' and 'elif' to avoid ambiguity with other languages.
(block_mapping_pair
  value: (block_node
    (block_scalar) @injection.content
    (#match? @injection.content "(def |class |if __name__|raise |except |lambda )")
    (#set! injection.language "python")
    (#offset! @injection.content 0 1 0 0)))

; Heuristic: inject javascript into block scalars containing common JS syntax.
; Excludes 'import' to avoid ambiguity with Python.
(block_mapping_pair
  value: (block_node
    (block_scalar) @injection.content
    (#match? @injection.content "(const |let |var |function |console\.|module\.exports|res\.|\.to\.)")
    (#set! injection.language "javascript")
    (#offset! @injection.content 0 1 0 0)))

; Heuristic: inject json into block scalars that start with { or [ after the |- header.
(block_mapping_pair
  value: (block_node
    (block_scalar) @injection.content
    (#match? @injection.content "|-\n\s*[{\[]")
    (#set! injection.language "json")
    (#offset! @injection.content 0 1 0 0)))

; Heuristic: inject graphql into block scalars containing common GraphQL keywords.
; Uses 'type [A-Z]' to avoid matching JSON "type": "..." fields.
(block_mapping_pair
  value: (block_node
    (block_scalar) @injection.content
    (#match? @injection.content "(query |mutation |subscription |fragment |type [A-Z]|schema |directive )")
    (#set! injection.language "graphql")
    (#offset! @injection.content 0 1 0 0)))
