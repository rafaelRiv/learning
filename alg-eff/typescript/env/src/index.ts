import * as env from "./lib/env"

const main = () => {
	const test1 = env.test().then(r => {
		console.log(r)
	})
  const test2 = env.Env.of("test")
  console.log("Hello world2")
}

main()

