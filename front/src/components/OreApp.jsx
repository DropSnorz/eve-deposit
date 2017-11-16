import React from 'react';
import Comparator from '../containers/Comparator.js';

class OreApp extends React.Component {

  render() {
    return 	<div>
    			<h1>Harvest</h1>
    			
                <Comparator mineralList = {this.props.mineralList} oreList = {this.props.oreList} reprocessingStats={this.props.reprocessingStats} />

    		</div>
  }
}

export default OreApp