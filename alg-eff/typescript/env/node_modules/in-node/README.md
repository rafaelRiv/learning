# in-node

[![Build Status](https://travis-ci.com/tusharmath/in-node.svg?branch=master)](https://travis-ci.com/tusharmath/in-node)
![npm](https://img.shields.io/npm/v/in-node.svg)

Checks if the program is running in node env. Shipped with proper typings.

# Index

- [Installation](#installation)
- [Usage](#usage)
- [Documentation](https://tusharmath.com/in-node)

# Installation

**npm:**

```bash
npm i in-node --save
```

**yarn:**

```bash
yarn add in-node
```

# Usage

```ts
import {inNode} from 'in-node'

if (isNode) {
  process.exit(1)
}
```
