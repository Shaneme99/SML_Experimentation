fun transform (f, nil) = nil
| transform (f, first:rest) = f(head) :: transform (f, rest);