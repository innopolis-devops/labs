import "./App.css";
import "./home"
import "./visits"

function App() {
  return (
      <Router>
      <Navbar />
      <Routes>
          <Route exact path='/' element={<Home />} />
          <Route path='/visits' element={<Visits/>} />
      </Routes>
      </Router>
  );
}

export default App;