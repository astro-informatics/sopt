#ifndef SOPT_EXCEPTION
#define SOPT_EXCEPTION

#include <exception>
#include <sstream>
#include <string>

namespace sopt {
  //! Root exception for sopt
  class Exception : public std::exception {

    protected:
     //! Constructor for derived classes
     Exception(std::string const & name, std::string const &filename, size_t lineno)
       : std::exception(), message(header(name, filename, lineno)) {}

    public:
     //! Creates exception
     Exception(std::string const &filename, size_t lineno)
       : Exception("sopt::Exception", filename, lineno) {}

     //! Creates message
     const char* what() const noexcept override { return message.c_str(); }

     //! Header of the message
     static std::string header(
         std::string const &name, std::string const &filename, size_t lineno) {
       return (std::ostringstream() << name << " at " << filename << ":" << lineno).str();
     }

     //! Adds to message
     template<class OBJECT>
       Exception& operator<<(OBJECT const &object) {
         message = (std::ostringstream() << message << object).str();
         return *this;
       }

    private:
     //! Message to issue
     std::string message;
  };

# define SOPT_THROW(MSG) throw (sopt::Exception(__FILE__, __LINE__) << "\n" << MSG)

} /* sopt */ 
#endif
