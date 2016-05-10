var SimpleHeader = React.createClass({
  getInitialState: function() {
    return {
      clicked: false
    }
  },
  userMenuisplayed: function(event) {
    this.setState( {clicked: !this.state.clicked})
  },
  userMenu: function() {
    if (this.state.clicked) {
      return (
        <div>
          <ul className='list-group pull-right list-inline'>
            <li className='list-group-item'>
              <a href='/users/profile'>profile</a>
            </li>
            <li className='list-group-item'>
              <a href='/'>item2</a>
            </li>
            <li className='list-group-item'>
              <a href='/'>item3</a>
            </li>
          </ul>
        </div>
      );
    }
  },
  userHeader: function() {
    if (this.props.userSignedIn) {
      return (
        <div>
          <button className='btn btn-default' onClick={this.userMenuisplayed}>menu</button>
          {this.userMenu()}
        </div>
      );
    } else {
      return (
        <div>
          <a href="/users/sign_up">Sign Up</a>
        </div>
      );
    }
  },
  render: function() {
    return (
      <ul　className='list-inline'>
        <li><h1 className='top_title text-left'><a href='/'>Top</a></h1></li>
        <li>{this.userHeader()}</li>
      </ul>
    );
  }
});
