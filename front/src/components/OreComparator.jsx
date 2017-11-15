import React from 'react';
import OreList from '../components/OreList.jsx';
import VisibleOreList from '../containers/VisibleOreList.js';
import Filter from '../containers/Filter.js';


class OreComparator extends React.Component {
  render() {
    return 	<div>
    			<div className="ore-filters">
    				<Filter mineralList = {this.props.mineralList} oreList={this.props.oreList} />
    			</div>

    			<div>
    				<VisibleOreList oreList={this.props.oreList} reprocessingStats={this.props.reprocessingStats} />
    			</div>

    		</div>
  }
}

export default OreComparator