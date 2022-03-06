import React from 'react'
import styles from './top-bar.module.scss'

export default class TopBar extends React.Component {
	render() {
		return (
			<div className={styles.top_bar}>
				<ul className={styles.sections_list}>
					<li className={styles.section}><a href="#home">Home</a></li>
				</ul>
			</div>
		)
	}
}
