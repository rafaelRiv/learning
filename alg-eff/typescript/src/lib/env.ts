/*
interface Printable {
  print(): string
}

function logValue(value: Printable) {
  console.log(value.print())
} */

type Printable<A> = {
  print(value: A): string
}

export class Env<R, E, A>  {
   static of<A, E = never>(a: A): Env<unknown, E, A> {
    return new Env()
  }
}
