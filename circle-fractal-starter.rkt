(require 2htdp/image)

;; circle-fractal-starter.rkt

;; =================
;; Constants:

(define STEP (/ 2 5))
(define CUTOFF 5)
(define COLOR "blue")
(define MTS (empty-scene 400 400))

;; =================
;; Functions:

;; Number -> Image
;; produce circle fractal of the given size
;(define (circle-fractal s) (circle 0 "solid" "white"))

(define (show-fractal s)
  (local
    [(define parts (circle-fractal s))]
    (above (first parts)
           (rotate 180 (second parts)))))

(define (circle-fractal s)
  (if (<= s CUTOFF)
      (list (circle s "solid" COLOR))
      (local
        [(define sub (first (circle-fractal (* s STEP))))]
        (list (above sub
                     (beside (rotate 90 sub) (circle s "solid" COLOR) (rotate -90 sub))) sub))))

(show-fractal 100)



