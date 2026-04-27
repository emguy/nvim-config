; extends

; Heuristic: inject bash into block scalars containing common shell commands,
; regardless of the key name (catches keys not covered by the built-in).
(block_mapping_pair
  value: (block_node
    (block_scalar) @injection.content
    (#match? @injection.content "(^|\n)(ls|git|cd|echo|source|fi|done|apt|yum|brew|mkdir|rm|cp|mv|chmod|chown|curl|wget)(\s|$)")
    (#set! injection.language "bash")
    (#offset! @injection.content 0 1 0 0)))
