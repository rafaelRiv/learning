module Main

data DoorState = DoorOpen | DoorClosed 

data DoorCmd : Type -> DoorState -> DoorState -> Type where
  OpenDoor : DoorCmd () DoorClosed DoorOpen
  CloseDoor : DoorCmd () DoorOpen DoorClosed
  RingBell : DoorCmd () DoorClosed DoorClosed

  Pure : ty -> DoorCmd ty state1 state2
  (>>=) : DoorCmd a state1 state2 -> (a -> DoorCmd b state2 state3) -> DoorCmd b state1 state3

(>>) : DoorCmd () state1 state2 ->
  Lazy (DoorCmd a state2 state3) ->
  DoorCmd a state1 state3
ma >> mb = ma >>= \ _ => mb

doorProg : DoorCmd () DoorClosed DoorClosed
doorProg = do
  RingBell
  OpenDoor
  CloseDoor
 
main : IO ()
main = putStrLn "Type safe protocols"


      

