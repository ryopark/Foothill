import React, { Component } from 'react'
import { Button } from 'react-bootstrap'

export default class TopPage extends Component {
	constructor(props) {
		super(props)
	}

	render() {
		return (
			<div>
				<Button>Sell Books</Button>
				<Button>Buy Books</Button>
			</div>
		)
	}
}