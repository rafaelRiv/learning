import * as fn from "fp-ts/function"
import * as RTE from "fp-ts/ReaderTaskEither"

export const test = () => fn.pipe(
  RTE.of(42),
  RTE.chain(n => RTE.of(n*2)),
  RTE.map(n => n.toString()),
	app => app({})()
)

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
